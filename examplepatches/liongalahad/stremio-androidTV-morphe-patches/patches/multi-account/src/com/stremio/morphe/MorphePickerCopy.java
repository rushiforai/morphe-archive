package com.stremio.morphe;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/** Account-picker copy that Stremio's currently incomplete profile translations do not provide. */
final class MorphePickerCopy {
    static final int CHOOSE_ACCOUNT = 0;
    static final int PRIVACY = 1;
    static final int ADD_ACCOUNT = 2;
    static final int EMPTY_HINT = 3;
    static final int OPTIONS_HINT = 4;
    static final int EXIT_STREMIO = 5;
    static final int ACTIVE = 6;
    private static final int FIELD_COUNT = 7;

    private static final Map<String, String[]> COPY;

    static {
        Map<String, String[]> copy = new HashMap<>();
        add(copy, "ar-AR", "اختر حسابًا", "يحتفظ كل حساب بتسجيل الدخول والمكتبة والإضافات وحالة المشاهدة الخاصة به.", "إضافة حساب", "حدد إضافة حساب لتسجيل الدخول باستخدام رمز الاستجابة السريعة", "اضغط مطولًا على موافق على الحساب للحصول على الخيارات", "اخرج من Stremio", "نشط");
        add(copy, "be-BY", "Выберыце ўліковы запіс", "Кожны ўліковы запіс захоўвае ўласны лагін, бібліятэку, адоны і стан прагляду.", "Дадаць уліковы запіс", "Выберыце Дадаць уліковы запіс, каб увайсці з дапамогай QR-кода", "Утрымлівайце ОК на ўліковым запісе, каб убачыць варыянты", "Выйсці з Stremio", "Актыўны");
        add(copy, "bg-BG", "Изберете акаунт", "Всеки акаунт поддържа собствено влизане, библиотека, добавки и състояние на гледане.", "Добавете акаунт", "Изберете Добавяне на акаунт, за да влезете с QR код", "Задръжте OK на акаунт за опции", "Излезте от Stremio", "Активен");
        add(copy, "bn-BD", "একটি অ্যাকাউন্ট চয়ন করুন", "প্রতিটি অ্যাকাউন্ট তার নিজস্ব লগইন, লাইব্রেরি, অ্যাডঅন এবং দেখার অবস্থা রাখে।", "অ্যাকাউন্ট যোগ করুন", "একটি QR কোড দিয়ে সাইন ইন করতে অ্যাকাউন্ট যোগ করুন নির্বাচন করুন", "বিকল্পগুলির জন্য একটি অ্যাকাউন্টে OK ধরে রাখুন", "Stremio থেকে প্রস্থান করুন", "সক্রিয়");
        add(copy, "ca-ES", "Trieu un compte", "Cada compte manté el seu propi inici de sessió, biblioteca, complements i estat de visualització.", "Afegeix un compte", "Seleccioneu Afegeix un compte per iniciar la sessió amb un codi QR", "Manteniu premut D'acord en un compte per veure les opcions", "Surt de Stremio", "Actiu");
        add(copy, "cs-CZ", "Vyberte účet", "Každý účet si uchovává své vlastní přihlašovací údaje, knihovnu, doplňky a stav sledování.", "Přidat účet", "Vyberte Přidat účet a přihlaste se pomocí QR kódu", "Možnosti zobrazíte podržením OK na účtu", "Ukončit Stremio", "Aktivní");
        add(copy, "da-DK", "Vælg en konto", "Hver konto beholder sit eget login, bibliotek, tilføjelser og sin seerstatus.", "Tilføj konto", "Vælg Tilføj konto for at logge ind med en QR-kode", "Hold OK på en konto for valgmuligheder", "Afslut Stremio", "Aktiv");
        add(copy, "de-DE", "Wählen Sie ein Konto", "Jedes Konto behält seine eigene Anmeldung, Bibliothek, Add-ons und seinen Wiedergabestatus.", "Konto hinzufügen", "Wählen Sie Konto hinzufügen, um sich mit einem QR-Code anzumelden", "Halten Sie OK auf einem Konto gedrückt, um Optionen anzuzeigen", "Stremio beenden", "Aktiv");
        add(copy, "el-GR", "Επιλέξτε έναν λογαριασμό", "Κάθε λογαριασμός διατηρεί τη δική του σύνδεση, βιβλιοθήκη, πρόσθετα και κατάσταση παρακολούθησης.", "Προσθήκη λογαριασμού", "Επιλέξτε Προσθήκη λογαριασμού για να συνδεθείτε με κωδικό QR", "Κρατήστε πατημένο το OK σε έναν λογαριασμό για επιλογές", "Έξοδος από το Stremio", "Ενεργός");
        add(copy, "en-US", "Choose an account", "Each account keeps its own login, library, addons and watch state.", "Add account", "Select Add account to sign in with a QR code", "Hold OK on an account for options", "Exit Stremio", "Active");
        add(copy, "eo-EO", "Elektu konton", "Ĉiu konto konservas sian propran ensaluton, bibliotekon, aldonaĵojn kaj spektadan staton.", "Aldoni konton", "Elektu Aldoni konton por ensaluti per QR-kodo", "Tenu OK sur konto por opcioj", "Eliri Stremio", "Aktiva");
        add(copy, "es-ES", "Elige una cuenta", "Cada cuenta mantiene su propio inicio de sesión, biblioteca, complementos y estado de visualización.", "Agregar cuenta", "Selecciona Agregar cuenta para iniciar sesión con un código QR", "Mantén pulsado Aceptar en una cuenta para ver opciones", "Salir de Stremio", "Activo");
        add(copy, "et-EE", "Valige konto", "Igal kontol on oma sisselogimine, meediakogu, lisad ja vaatamise olek.", "Lisa konto", "QR-koodiga sisselogimiseks valige Lisa konto", "Valikute nägemiseks hoidke kontol nuppu OK", "Välju Stremiost", "Aktiivne");
        add(copy, "eu-ES", "Aukeratu kontu bat", "Kontu bakoitzak bere saio-hasiera, liburutegia, gehigarriak eta ikustaldi-egoera gordetzen ditu.", "Gehitu kontua", "Hautatu Gehitu kontua QR kode batekin saioa hasteko", "Eduki sakatuta Ados kontu batean aukerak ikusteko", "Irten Stremiotik", "Aktiboa");
        add(copy, "fa-IR", "یک حساب کاربری انتخاب کنید", "هر حساب کاربری ورود، کتابخانه، افزونه‌ها و وضعیت تماشای خود را حفظ می‌کند.", "افزودن حساب", "برای ورود با کد QR، افزودن حساب را انتخاب کنید", "برای گزینه‌ها، OK را روی یک حساب نگه دارید", "خروج از Stremio", "فعال");
        add(copy, "fi-FI", "Valitse tili", "Jokaisella tilillä on omat kirjautumistiedot, kirjasto, lisäosat ja katselutila.", "Lisää tili", "Valitse Lisää tili kirjautuaksesi QR-koodilla", "Avaa valinnat pitämällä OK-painiketta painettuna tilin kohdalla", "Poistu Stremiosta", "Aktiivinen");
        add(copy, "fr-FR", "Choisissez un compte", "Chaque compte conserve sa propre connexion, sa bibliothèque, ses extensions et son historique de visionnage.", "Ajouter un compte", "Sélectionnez Ajouter un compte pour vous connecter avec un code QR", "Maintenez OK sur un compte pour afficher les options", "Quitter Stremio", "Actif");
        add(copy, "he-IL", "בחר חשבון", "כל חשבון שומר על פרטי הכניסה, הספרייה, התוספים ומצב הצפייה שלו.", "הוסף חשבון", "בחר הוסף חשבון כדי להיכנס באמצעות קוד QR", "לחץ לחיצה ארוכה על OK בחשבון כדי לראות אפשרויות", "צא מ-Stremio", "פעיל");
        add(copy, "hi-IN", "एक खाता चुनें", "प्रत्येक खाता अपना लॉगिन, लाइब्रेरी, ऐडऑन और देखने की स्थिति अलग रखता है।", "खाता जोड़ें", "QR कोड से साइन इन करने के लिए खाता जोड़ें चुनें", "विकल्पों के लिए किसी खाते पर OK दबाए रखें", "Stremio से बाहर निकलें", "सक्रिय");
        add(copy, "hr-HR", "Odaberite račun", "Svaki račun čuva vlastitu prijavu, biblioteku, dodatke i stanje gledanja.", "Dodaj račun", "Odaberite Dodaj račun za prijavu pomoću QR koda", "Držite OK na računu za opcije", "Izađi iz Stremia", "Aktivan");
        add(copy, "hu-HU", "Válasszon egy fiókot", "Minden fiók megőrzi saját bejelentkezését, könyvtárát, kiegészítőit és megtekintési állapotát.", "Fiók hozzáadása", "Válassza a Fiók hozzáadása lehetőséget a QR-kódos bejelentkezéshez", "A lehetőségekhez tartsa lenyomva az OK gombot egy fióknál", "Kilépés a Stremióból", "Aktív");
        add(copy, "id-ID", "Pilih akun", "Setiap akun menyimpan login, pustaka, add-on, dan status tontonnya sendiri.", "Tambahkan akun", "Pilih Tambahkan akun untuk masuk dengan kode QR", "Tahan OK pada akun untuk opsi", "Keluar dari Stremio", "Aktif");
        add(copy, "it-IT", "Scegli un account", "Ogni account mantiene separati accesso, libreria, addon e stato di visione.", "Aggiungi account", "Seleziona Aggiungi account per accedere con un codice QR", "Tieni premuto OK su un account per le opzioni", "Esci da Stremio", "Attivo");
        add(copy, "ja-JP", "アカウントを選択", "各アカウントのログイン、ライブラリ、アドオン、視聴状況は個別に保存されます。", "アカウントを追加", "QRコードでログインするには「アカウントを追加」を選択してください", "オプションを開くにはアカウントでOKを長押ししてください", "Stremioを終了", "アクティブ");
        add(copy, "ko-KR", "계정 선택", "각 계정의 로그인, 라이브러리, 애드온 및 시청 상태는 별도로 유지됩니다.", "계정 추가", "QR 코드로 로그인하려면 계정 추가를 선택하세요", "옵션을 보려면 계정에서 확인을 길게 누르세요", "Stremio 종료", "활성");
        add(copy, "lt-LT", "Pasirinkite paskyrą", "Kiekviena paskyra turi atskirus prisijungimo duomenis, biblioteką, priedus ir žiūrėjimo būseną.", "Pridėti paskyrą", "Pasirinkite Pridėti paskyrą, kad prisijungtumėte QR kodu", "Norėdami pamatyti parinktis, paskyroje laikykite OK", "Išeiti iš Stremio", "Aktyvi");
        add(copy, "mk-MK", "Изберете сметка", "Секоја сметка има сопствено најавување, библиотека, додатоци и состојба на гледање.", "Додајте сметка", "Изберете Додај сметка за да се најавите со QR-код", "Држете ОК на сметка за опциите", "Излезете од Stremio", "Активна");
        add(copy, "my-BM", "အကောင့်တစ်ခုရွေးပါ", "အကောင့်တစ်ခုစီ၏ အကောင့်ဝင်မှု၊ စာကြည့်တိုက်၊ အပိုပရိုဂရမ်များနှင့် ကြည့်ရှုမှုအခြေအနေကို သီးခြားသိမ်းထားသည်။", "အကောင့်ထည့်ပါ", "QR ကုဒ်ဖြင့် ဝင်ရန် အကောင့်ထည့်ပါကို ရွေးပါ", "ရွေးချယ်စရာများအတွက် အကောင့်ပေါ်တွင် OK ကို ဖိထားပါ", "Stremio မှ ထွက်ပါ", "အသုံးပြုနေသည်");
        add(copy, "nb-NO", "Velg en konto", "Hver konto beholder egen pålogging, bibliotek, tillegg og seerstatus.", "Legg til konto", "Velg Legg til konto for å logge på med en QR-kode", "Hold OK på en konto for alternativer", "Avslutt Stremio", "Aktiv");
        add(copy, "ne-NP", "एउटा खाता छान्नुहोस्", "प्रत्येक खाताले आफ्नै लगइन, पुस्तकालय, एडअन र हेर्ने स्थिति राख्छ।", "खाता थप्नुहोस्", "QR कोडबाट साइन इन गर्न खाता थप्नुहोस् चयन गर्नुहोस्", "विकल्पहरूको लागि खातामा OK थिचिराख्नुहोस्", "Stremio बाट बाहिर निस्कनुहोस्", "सक्रिय");
        add(copy, "nl-NL", "Kies een account", "Elk account behoudt zijn eigen login, bibliotheek, add-ons en kijkstatus.", "Account toevoegen", "Selecteer Account toevoegen om in te loggen met een QR-code", "Houd OK ingedrukt op een account voor opties", "Stremio afsluiten", "Actief");
        add(copy, "nn-NO", "Vel ein konto", "Kvar konto beheld eiga innlogging, bibliotek, tillegg og sjåarstatus.", "Legg til konto", "Vel Legg til konto for å logge på med ein QR-kode", "Hald OK på ein konto for alternativ", "Avslutt Stremio", "Aktiv");
        add(copy, "pa-IN", "ਇੱਕ ਖਾਤਾ ਚੁਣੋ", "ਹਰੇਕ ਖਾਤਾ ਆਪਣਾ ਲੌਗਇਨ, ਲਾਇਬ੍ਰੇਰੀ, ਐਡਆਨ ਅਤੇ ਦੇਖਣ ਦੀ ਸਥਿਤੀ ਵੱਖ ਰੱਖਦਾ ਹੈ।", "ਖਾਤਾ ਸ਼ਾਮਲ ਕਰੋ", "QR ਕੋਡ ਨਾਲ ਸਾਈਨ ਇਨ ਕਰਨ ਲਈ ਖਾਤਾ ਸ਼ਾਮਲ ਕਰੋ ਚੁਣੋ", "ਵਿਕਲਪਾਂ ਲਈ ਖਾਤੇ ਉੱਤੇ OK ਦਬਾ ਕੇ ਰੱਖੋ", "Stremio ਤੋਂ ਬਾਹਰ ਜਾਓ", "ਕਿਰਿਆਸ਼ੀਲ");
        add(copy, "pl-PL", "Wybierz konto", "Każde konto zachowuje własne dane logowania, bibliotekę, dodatki i stan oglądania.", "Dodaj konto", "Wybierz Dodaj konto, aby zalogować się kodem QR", "Przytrzymaj OK na koncie, aby wyświetlić opcje", "Wyjdź ze Stremio", "Aktywne");
        add(copy, "pt-BR", "Escolha uma conta", "Cada conta mantém seu próprio login, biblioteca, complementos e estado de exibição.", "Adicionar conta", "Selecione Adicionar conta para entrar com um código QR", "Segure OK em uma conta para ver as opções", "Sair do Stremio", "Ativa");
        add(copy, "pt-PT", "Escolha uma conta", "Cada conta mantém o seu próprio início de sessão, biblioteca, complementos e estado de visualização.", "Adicionar conta", "Selecione Adicionar conta para iniciar sessão com um código QR", "Mantenha OK premido numa conta para ver as opções", "Sair do Stremio", "Ativa");
        add(copy, "ro-RO", "Alegeți un cont", "Fiecare cont își păstrează propria autentificare, bibliotecă, extensii și stare de vizionare.", "Adăugați un cont", "Selectați Adăugați un cont pentru a vă conecta cu un cod QR", "Țineți apăsat OK pe un cont pentru opțiuni", "Ieșiți din Stremio", "Activ");
        add(copy, "ru-RU", "Выберите учетную запись", "Каждая учетная запись сохраняет собственные данные входа, библиотеку, дополнения и состояние просмотра.", "Добавить учетную запись", "Выберите Добавить учетную запись, чтобы войти с помощью QR-кода", "Удерживайте ОК на учетной записи, чтобы открыть параметры", "Выйти из Stremio", "Активна");
        add(copy, "sk-SK", "Vyberte účet", "Každý účet si uchováva vlastné prihlasovacie údaje, knižnicu, doplnky a stav sledovania.", "Pridať účet", "Vyberte Pridať účet a prihláste sa pomocou QR kódu", "Možnosti zobrazíte podržaním OK na účte", "Ukončiť Stremio", "Aktívne");
        add(copy, "sl-SL", "Izberite račun", "Vsak račun hrani lastno prijavo, knjižnico, dodatke in stanje gledanja.", "Dodaj račun", "Izberite Dodaj račun za prijavo s kodo QR", "Pridržite OK na računu za možnosti", "Zapri Stremio", "Aktiven");
        add(copy, "sr-RS", "Изаберите налог", "Сваки налог чува сопствену пријаву, библиотеку, додатке и стање гледања.", "Додај налог", "Изаберите Додај налог да бисте се пријавили помоћу QR кода", "Држите ОК на налогу за опције", "Изађи из Stremio", "Активан");
        add(copy, "sv-SE", "Välj ett konto", "Varje konto behåller sin egen inloggning, sitt bibliotek, sina tillägg och sin visningsstatus.", "Lägg till konto", "Välj Lägg till konto för att logga in med en QR-kod", "Håll OK på ett konto för alternativ", "Avsluta Stremio", "Aktiv");
        add(copy, "ta-IN", "ஒரு கணக்கைத் தேர்ந்தெடுக்கவும்", "ஒவ்வொரு கணக்கும் அதன் உள்நுழைவு, நூலகம், துணை நிரல்கள் மற்றும் பார்க்கும் நிலையைத் தனித்தனியாக வைத்திருக்கும்.", "கணக்கைச் சேர்க்கவும்", "QR குறியீட்டைப் பயன்படுத்தி உள்நுழைய கணக்கைச் சேர் என்பதைத் தேர்ந்தெடுக்கவும்", "விருப்பங்களுக்கு கணக்கில் OK ஐ அழுத்திப் பிடிக்கவும்", "Stremio இலிருந்து வெளியேறு", "செயலில்");
        add(copy, "te-IN", "ఖాతాను ఎంచుకోండి", "ప్రతి ఖాతా దాని స్వంత లాగిన్, లైబ్రరీ, యాడ్‌ఆన్‌లు మరియు వీక్షణ స్థితిని వేరుగా ఉంచుతుంది.", "ఖాతాను జోడించండి", "QR కోడ్‌తో సైన్ ఇన్ చేయడానికి ఖాతాను జోడించు ఎంచుకోండి", "ఎంపికల కోసం ఖాతాలో OK నొక్కి పట్టుకోండి", "Stremio నుండి నిష్క్రమించండి", "చురుకుగా");
        add(copy, "tr-TR", "Bir hesap seçin", "Her hesap kendi giriş bilgilerini, kitaplığını, eklentilerini ve izleme durumunu korur.", "Hesap ekle", "QR koduyla oturum açmak için Hesap ekle'yi seçin", "Seçenekler için bir hesapta Tamam'ı basılı tutun", "Stremio'dan çık", "Aktif");
        add(copy, "uk-UA", "Виберіть обліковий запис", "Кожен обліковий запис зберігає власні дані входу, бібліотеку, доповнення та стан перегляду.", "Додати обліковий запис", "Виберіть Додати обліковий запис, щоб увійти за допомогою QR-коду", "Утримуйте OK на обліковому записі, щоб переглянути параметри", "Вийти зі Stremio", "Активний");
        add(copy, "ur-PK", "ایک اکاؤنٹ منتخب کریں", "ہر اکاؤنٹ اپنا لاگ ان، لائبریری، ایڈونز اور دیکھنے کی حالت الگ رکھتا ہے۔", "اکاؤنٹ شامل کریں", "QR کوڈ سے سائن ان کرنے کے لیے اکاؤنٹ شامل کریں منتخب کریں", "اختیارات کے لیے اکاؤنٹ پر OK کو دبائے رکھیں", "Stremio سے باہر نکلیں", "فعال");
        add(copy, "vi-VN", "Chọn một tài khoản", "Mỗi tài khoản giữ thông tin đăng nhập, thư viện, tiện ích bổ sung và trạng thái xem riêng.", "Thêm tài khoản", "Chọn Thêm tài khoản để đăng nhập bằng mã QR", "Giữ OK trên một tài khoản để xem các tùy chọn", "Thoát Stremio", "Đang hoạt động");
        add(copy, "zh-CN", "选择账户", "每个账户都单独保存自己的登录信息、媒体库、插件和观看状态。", "添加账户", "选择添加账户以使用二维码登录", "在账户上长按确定以查看选项", "退出 Stremio", "当前使用");
        add(copy, "zh-HK", "選擇帳戶", "每個帳戶都會分開儲存自己的登入資料、媒體庫、外掛程式和觀看狀態。", "新增帳戶", "選擇新增帳戶以使用二維碼登入", "在帳戶上長按確定以查看選項", "退出 Stremio", "目前使用");
        add(copy, "zh-TW", "選擇帳戶", "每個帳戶都會分開儲存自己的登入資訊、媒體庫、附加元件和觀看狀態。", "新增帳戶", "選擇新增帳戶以使用 QR 碼登入", "在帳戶上長按確定以查看選項", "退出 Stremio", "目前使用");
        COPY = Collections.unmodifiableMap(copy);
    }

    private MorphePickerCopy() {}

    static String get(String locale, int field, String fallback) {
        String[] values = COPY.get(locale);
        return values == null || field < 0 || field >= values.length || values[field].trim().isEmpty()
                ? fallback : values[field];
    }

    static boolean hasCompleteLocale(String locale) {
        String[] values = COPY.get(locale);
        if (values == null || values.length != FIELD_COUNT) return false;
        for (String value : values) if (value == null || value.trim().isEmpty()) return false;
        return true;
    }

    private static void add(Map<String, String[]> copy, String locale, String... values) {
        if (values.length != FIELD_COUNT) throw new IllegalArgumentException(locale);
        copy.put(locale, values);
    }
}
