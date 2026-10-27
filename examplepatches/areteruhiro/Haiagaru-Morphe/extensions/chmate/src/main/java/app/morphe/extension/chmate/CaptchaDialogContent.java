package app.morphe.extension.chmate;

/** Presentation only: keep the original form, scripts, tokens and provider frames intact. */
final class CaptchaDialogContent {
    private CaptchaDialogContent() { }
    static final String SCRIPT = """
        (() => {
          const widget = document.querySelector('.g-recaptcha,.h-captcha,.cf-turnstile,.local-pow,[data-pow-start]');
          const form = widget && widget.closest('form');
          if (!form || document.getElementById('haiagaru-captcha-presentation')) return false;
          const style = document.createElement('style');
          style.id = 'haiagaru-captcha-presentation';
          style.textContent = '.haiagaru-captcha-hidden{display:none!important}' +
            'html,body{background:transparent!important;margin:0!important;padding:0!important;min-width:0!important}' +
            'form[data-haiagaru-captcha]{margin:0!important;padding:8px!important;box-sizing:border-box;max-width:100%}';
          document.head.appendChild(style);
          form.setAttribute('data-haiagaru-captcha','');
          function providerFrame(node) {
            if (node.nodeType !== 1) return false;
            const frames = node.tagName === 'IFRAME' ? [node] : node.querySelectorAll('iframe');
            return Array.from(frames).some(f => /recaptcha|hcaptcha|challenges[.]cloudflare[.]com/i.test(f.src));
          }
          // Hide only existing page furniture outside the form. Provider challenge
          // overlays added later remain visible, including full image challenges.
          for (let keep = form, parent = form.parentElement; parent && parent !== document.documentElement;
               keep = parent, parent = parent.parentElement) {
            Array.from(parent.childNodes).forEach(node => {
              if (node === keep || providerFrame(node)) return;
              if (node.nodeType === 1 && !/^(SCRIPT|STYLE|LINK|META)$/.test(node.tagName))
                node.classList.add('haiagaru-captcha-hidden');
              else if (node.nodeType === 3 && node.textContent.trim()) {
                const hidden = document.createElement('span');
                hidden.className = 'haiagaru-captcha-hidden';
                node.replaceWith(hidden); hidden.appendChild(node);
              }
            });
          }
          return true;
        })()
        """;
}
