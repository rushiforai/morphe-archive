import asyncio
from playwright.async_api import async_playwright
async def main():
 async with async_playwright() as p:
  b=await p.chromium.launch(headless=True); page=await b.new_page(viewport={'width':1600,'height':1100})
  await page.goto('https://maps-docs-team.web.app/samples/map-simple/dist/',wait_until='domcontentloaded',timeout=25000)
  await page.wait_for_function("()=>typeof window.google?.maps?.Map==='function'",timeout=25000)
  for mode in ['LIGHT','DARK']:
   await page.evaluate('''mode=>{document.body.innerHTML='';const el=document.createElement('div');el.style.width='1600px';el.style.height='1100px';document.body.append(el);window.referenceMap=new google.maps.Map(el,{center:{lat:51.520,lng:-0.17},zoom:15,colorScheme:mode,disableDefaultUI:true,mapTypeId:'roadmap'});}''',mode)
   await page.wait_for_timeout(5000)
   await page.screenshot(path=f'references/google-wide-{mode.lower()}.png')
  await b.close()
asyncio.run(main())
