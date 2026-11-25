"""The capture verifier must validate both providers and their exact probe sessions."""
import copy
import importlib.util
from pathlib import Path
import unittest
spec=importlib.util.spec_from_file_location('navigation_events',Path(__file__).resolve().parents[1]/'scripts/navigation-probe/verify_events.py')
module=importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)

class CommonNavigationCaptureTests(unittest.TestCase):
    def capture(self):
        rows=[]
        sessions={'com.waze':'waze-test','nl.flitsmeister':'flitsmeister-test'}
        for provider,session in sessions.items():
            for seq,at in enumerate([1000,5000,6000,7000],1):
                n={'source_package':provider,'publisher_session_id':session,'schema_version':1,'sequence':seq,'sent_elapsed_ms':at,
                   'current_speed_status':'valid','current_speed_kmh':72 if seq==1 else 0,'current_speed_updated_elapsed_ms':at,'current_speed_max_age_ms':5000,
                   'road_speed_limit_status':'valid','road_speed_limit_kmh':104.60736,'road_updated_elapsed_ms':1000,'road_max_age_ms':30000,
                   'zone_status':'active','zone_segment_id':'a' if seq<3 else 'b','zone_session':1 if seq<3 else 2,
                   'zone_updated_elapsed_ms':at,'zone_observation_start_elapsed_ms':1000 if seq<3 else 6000,
                   'zone_remaining_m':900,'zone_progress_percent':10,'zone_observed_distance_m':100 if seq==2 else 0,
                   'zone_average_partial':True,'zone_average_method':'observed_distance_over_elapsed_time'}
                if seq==2:n['zone_average_speed_kmh']=90
                if seq==4:
                    n={k:v for k,v in n.items() if not k.startswith('zone_') and k not in ['current_speed_kmh','road_speed_limit_kmh']}
                    n.update(zone_status='inactive',current_speed_status='unknown',road_speed_limit_status='unknown')
                rows.append({'extras':n,'sender_package':provider,'sender_uid':10001 if provider=='com.waze' else 10002,'receiver_uid':10003})
        return rows,sessions

    def test_both_providers_use_same_verifier_without_cross_provider_session_state(self):
        rows,sessions=self.capture()
        restarted=copy.deepcopy(rows[0]);restarted['extras']['publisher_session_id']='later-unobserved-process';rows.append(restarted)
        result=module.verify(rows,sessions)
        self.assertEqual(set(result),{'com.waze','nl.flitsmeister'})
        self.assertTrue(all(v['cross_uid_authenticated'] for v in result.values()))

    def test_an_inherited_average_or_unauthenticated_source_fails(self):
        rows,sessions=self.capture()
        rows[2]['extras']['zone_average_speed_kmh']=90
        with self.assertRaises(AssertionError):module.verify(rows,sessions)
        rows,sessions=self.capture();rows[-1]['sender_package']='spoofed'
        with self.assertRaises(AssertionError):module.verify(rows,sessions)

if __name__=='__main__':unittest.main()
