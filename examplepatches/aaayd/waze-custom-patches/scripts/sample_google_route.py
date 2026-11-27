import asyncio
from playwright.async_api import async_playwright
async def main():
 async with async_playwright() as p:
  ctx=await p.chromium.launch_persistent_context('references/browser-profile',headless=True,viewport={'width':1600,'height':1100})
  page=await ctx.new_page()
  await page.goto('https://www.google.com/maps/dir/Hyde+Park,+London/Westminster+Abbey,+London/',wait_until='domcontentloaded',timeout=30000)
  await page.wait_for_timeout(9000)
  await page.screenshot(path='references/google-route-day.png')
  print('Saved Google Maps route reference to references/google-route-day.png')
  await ctx.close()
asyncio.run(main())
