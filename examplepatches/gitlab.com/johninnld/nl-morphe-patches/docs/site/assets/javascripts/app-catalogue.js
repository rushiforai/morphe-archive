/* All cards and links are rendered at build time; filtering is optional. */
(() => {
  const catalogue = document.querySelector('.dap-catalogue');
  if (!catalogue) return;
  const search = catalogue.querySelector('input[type="search"]');
  const buttons = [...catalogue.querySelectorAll('button[data-category]')];
  const cards = [...catalogue.querySelectorAll('.dap-app-card')];
  const count = catalogue.querySelector('[data-app-count]');
  const empty = catalogue.querySelector('.dap-catalogue__empty');
  let category = 'all';

  function filter() {
    const query = search.value.trim().toLowerCase();
    let visible = 0;
    for (const card of cards) {
      card.hidden = !(category === 'all' || card.dataset.category === category) ||
        !card.dataset.search.includes(query);
      if (!card.hidden) visible++;
    }
    count.textContent = `${visible} / ${cards.length} apps`;
    empty.hidden = visible > 0;
  }

  search.addEventListener('input', filter);
  for (const button of buttons) {
    button.addEventListener('click', () => {
      category = button.dataset.category;
      for (const option of buttons) option.setAttribute('aria-pressed', String(option === button));
      filter();
    });
  }
  catalogue.querySelector('.dap-catalogue__tools').hidden = false;
})();
