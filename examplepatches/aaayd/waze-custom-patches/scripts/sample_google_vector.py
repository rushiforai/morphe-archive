import asyncio
from playwright.async_api import async_playwright
from pathlib import Path
async def main():
 async with async_playwright() as p:
  browser=await p.chromium.launch(headless=True,args=["--enable-unsafe-swiftshader"])
  page=await browser.new_page(viewport={'width':1600,'height':1100},device_scale_factor=1)
  await page.goto('https://maps-docs-team.web.app/samples/map-simple/dist/',wait_until='domcontentloaded',timeout=25000)
  print(await page.title(),flush=True); await page.wait_for_function("() => typeof window.google?.maps?.Map === 'function'",timeout=25000)
  print(await page.evaluate('typeof google'))
  for mode in ['LIGHT','DARK']:
   await page.evaluate('''mode=>{ document.body.innerHTML=''; document.body.style.margin='0'; const el=document.createElement('div'); el.style.width='1600px'; el.style.height='1100px'; document.body.append(el); window.referenceMap=new google.maps.Map(el,{center:{lat:51.5074,lng:-0.1657},zoom:16,mapId:'DEMO_MAP_ID',renderingType:google.maps.RenderingType.VECTOR,colorScheme:mode,disableDefaultUI:true,mapTypeId:'roadmap',isFractionalZoomEnabled:false}); }''',mode)
   await page.wait_for_timeout(7000); print(await page.evaluate('referenceMap.getRenderingType()'),flush=True)
   await page.screenshot(path=f'references/google-vector-{mode.lower()}.png')
  await browser.close()
asyncio.run(main())
