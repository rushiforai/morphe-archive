"""Build explicit Waze colours from recorded Google map reference samples."""
from pathlib import Path
from zipfile import ZipFile
from collections import Counter
import json
from PIL import Image
from lupa.lua54 import LuaRuntime
ROOT=Path(__file__).resolve().parents[1]
refs=ROOT/'references'
source_images=['google-live-light.png','google-live-dark.png','google-wide-light.png','google-wide-dark.png','google-route-day.png','google-hydepark-day-tile.png','google-westminster-day-tile.png']
counts={f:Counter(Image.open(refs/f).convert('RGB').getdata()) for f in source_images}
roles={
 'day':dict(land='F6F5F5',park='C3F1D5',water='90DAEE',major='D8E0E7',motorway='8BA5C1',minor='CFD9E3',outline='BDC8D0',label='44566D',city_label='354557',halo='FFFFFF',park_label='19865F',water_label='0A8699',path='90D7BA',selected='450EFB',selected_outline='23038E',alternative='B8C9FE',alternative_outline='3130F7',destination='EA4335'),
 'night':dict(land='1C2A40',park='144A57',water='00102E',major='3E5A77',motorway='3E5A77',minor='3E5A77',outline='191D23',label='C4CCD7',city_label='C4CCD7',halo='191D23',park_label='82B891',water_label='8AB4F8',path='196356',selected='450EFB',selected_outline='23038E',alternative='B8C9FE',alternative_outline='3130F7',destination='EA4335')
}
report={'reference':'Google Maps official live JS sample, Hyde Park London z16 and Paddington z15, plus Google Maps web directions Hyde Park to Westminster Abbey','date':'2026-09-30','urls':['https://maps-docs-team.web.app/samples/map-simple/dist/','https://www.google.com/maps/dir/Hyde+Park,+London/Westminster+Abbey,+London/'],'limits':['Exact recorded RGB samples, not a Google style-source export. Raster compression and zoom can produce multiple neighbouring colours.','Route colours are from the day web directions reference and deliberately shared across both modes; a Google phone night navigation route was not sampled.','Only Waze map skin categories are mapped. Traffic/incident status colours and UI outside the map retain Waze values.','Waze has fewer land-use categories and different geometry, antialiasing and rendering. This cannot make every screen pixel identical.'],'modes':{}}
z=ZipFile(ROOT/'downloads/waze-arm64/base.apk')
for mode,r in roles.items():
 lua=LuaRuntime();lua.execute(z.read('assets/res/scripts/enviroment.lua').decode());lua.execute(z.read(f'assets/res/skins/default/skin_values.{mode}.lua').decode())
 groups=lua.globals().Colors
 colors={}
 def setv(g,k,role):
  if groups[g][k] is not None: colors[g+'.'+k]=r.get(role,role)
 for g,fill in {'Freeways':'motorway','Highways':'motorway','Primary':'major','Secondary':'major','Street':'minor','Private':'minor','Trails4X4':'minor','Ramps':'major','Exit':'major','Parking':'minor','Alleys':'minor','Pedestrian':'minor','Trails':'path','Walkway':'path','Railroads':'minor','Ferry':'water_label'}.items():
  for weight in ['light','medium','strong']:
   setv(g,weight+'_fill',fill)
   setv(g,weight+'_stroke','water_label' if g=='Ferry' else ('path' if g in ['Trails','Walkway'] else 'outline'))
   setv(g,weight+'_label','water_label' if g=='Ferry' else 'label')
 for g,fill,label in [('Cities','land','city_label'),('Stations','land','label'),('ParkingLots','land','label'),('ParkingLotsPins','minor','label'),('Parks','park','park_label'),('Sea','water','water_label'),('Lakes','water','water_label'),('Rivers','water','water_label')]:
  for weight in ['light','medium','strong']:
   setv(g,weight+'_fill',fill);setv(g,weight+'_label',label)
 for key,role in {'map_background':'land','missing':'land','labels_bgcolor':'halo','map_selection_color':'selected','map_one_way_color':'label','map_points_color':'alternative'}.items():setv('General',key,role)
 for key,role in {'fill':'minor','strokes':'outline','labels':'label','labels_bgcolor':'halo'}.items():setv('Defaults',key,role)
 setv('AdPinBusinessName','labels_color','label');setv('AdPinBusinessName','labels_outline_color','halo')
 for g in ['Navigation','RoutePreviewSelected','AltBlueSelected','AltGreenSelected','AltOrangeSelected']:
  setv(g,'fill','selected');setv(g,'stroke','selected_outline');setv(g,'label','FFFFFF');setv(g,'labelBg','selected_outline')
 for g in ['RoutePreviewUnselected','RouteDetour','RouteSnail','ViaSnail','AltBlueUnselected','AltGreenUnselected','AltOrangeUnselected']:
  setv(g,'fill','alternative');setv(g,'stroke','alternative_outline');setv(g,'label','city_label');setv(g,'labelBg','halo')
 setv('StopPoint','fill','destination');setv('StopPoint','stroke','destination');setv('StopPoint','label','FFFFFF');setv('StopPoint','labelBg','destination')
 palette_keys={'map_background':'land','map_missing':'land','labels':'label','labels_strong':'city_label','labels_bgcolor':'halo','oneWay':'label','points':'alternative','selection':'selected','freeways':'motorway','primary':'major','secondary':'major','highways':'motorway','street':'minor','private':'minor','trails4x4':'minor','alleys':'minor','ramps':'major','parking':'minor','parking_lots':'land','parking_lots_pins':'minor','railroads':'minor','ferry_stroke':'water_label','pedestrian':'minor','trails':'path','walkway':'path','cities':'land','stations':'land','parks':'park','sea':'water','lakes':'water','rivers':'water','label_station':'label','label_cities':'city_label','label_vegetation':'park_label','label_water':'water_label','ad_labels_color':'label','ad_labels_outline_color':'halo','navigation':'selected','stop_point':'destination','snail':'alternative','snail_via':'alternative','detour':'alternative','detour_stroke':'alternative_outline','alt_color_1':'alternative','alt_color_2':'alternative','alt_color_3':'alternative','alt_color_current':'selected','route_preview_unselected_fill':'alternative','route_preview_unselected_stroke':'alternative_outline'}
 palette={k:r[v] for k,v in palette_keys.items()}
 for suffix,values in [('',palette),('.colors',colors)]:
  (ROOT/f'src/main/resources/themes/{mode}{suffix}.properties').write_text('# Generated by scripts/build_sampled_themes.py; RGB values from Google reference captures.\n'+'\n'.join(f'{k}={v}' for k,v in sorted(values.items()))+'\n')
 evidence={}
 for role,value in r.items():
  pixel=tuple(bytes.fromhex(value));sources=[{'image':f,'matching_pixels':c[pixel]} for f,c in counts.items() if c[pixel]]
  assert sources,(mode,role,value)
  evidence[role]={'hex':'#'+value,'sources':sources}
 report['modes'][mode]={'roles':evidence,'renderer_overrides':len(colors),'palette_entries':len(palette)}
(refs/'google-colour-provenance.json').write_text(json.dumps(report,indent=2)+'\n')
print({m:{k:v for k,v in data.items() if k!='roles'} for m,data in report['modes'].items()})
