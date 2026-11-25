"""Exact manifest effect for the independently started Google Ads initializer."""
import xml.etree.ElementTree as ET
from pathlib import Path

ANDROID = '{http://schemas.android.com/apk/res/android}'


def restore_ad_resources(manifest):
    nodes = manifest.findall('.//provider')
    matches = [node for node in nodes if node.get(ANDROID+'name') == 'com.google.android.gms.ads.MobileAdsInitProvider']
    assert len(matches) == 1, 'Google Ads initializer changed'
    node, = matches
    assert node.get(ANDROID+'enabled') == 'false', 'Google Ads auto-initializer remains enabled'
    del node.attrib[ANDROID+'enabled']
    return manifest


def verify_ad_resources(root):
    restore_ad_resources(ET.parse(Path(root)/'AndroidManifest.xml').getroot())
