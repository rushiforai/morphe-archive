package com.teslacoilsw.tesladirect;

import a5.a0;
import a5.a1;
import a5.h2;
import a5.q0;
import a5.s0;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.Editable;
import android.view.View;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.core.graphics.Insets;
import com.google.android.gms.internal.measurement.z6;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.WeakHashMap;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import o30.i;
import org.json.JSONObject;
import w20.a;
import z30.b;
import z30.c;
import z30.d;

/* loaded from: classes4.dex */
public class DirectLicensingEnterCode extends a {

    /* renamed from: k, reason: collision with root package name */
    public static String f46520k;

    /* renamed from: b, reason: collision with root package name */
    public z6 f46521b;

    /* renamed from: c, reason: collision with root package name */
    public Button f46522c;

    /* renamed from: f, reason: collision with root package name */
    public PublicKey f46525f;

    /* renamed from: g, reason: collision with root package name */
    public AutoCompleteTextView f46526g;

    /* renamed from: h, reason: collision with root package name */
    public EditText f46527h;

    /* renamed from: d, reason: collision with root package name */
    public boolean f46523d = false;

    /* renamed from: e, reason: collision with root package name */
    public int f46524e = 0;

    /* renamed from: i, reason: collision with root package name */
    public final Random f46528i = new Random();

    /* renamed from: j, reason: collision with root package name */
    public Toast f46529j = null;

    public static String a(HashMap map) throws IOException {
        String str = URLEncoder.encode("data", "UTF-8") + "=" + URLEncoder.encode(new JSONObject(map).toString(), "UTF-8");
        URLConnection uRLConnectionOpenConnection = new URL("https://api.novalauncher.com/verifyLicense").openConnection();
        uRLConnectionOpenConnection.setDoOutput(true);
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(uRLConnectionOpenConnection.getOutputStream());
        outputStreamWriter.write(str);
        outputStreamWriter.flush();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(uRLConnectionOpenConnection.getInputStream()));
        StringBuilder sb2 = new StringBuilder();
        while (true) {
            String line = bufferedReader.readLine();
            if (line == null) {
                outputStreamWriter.close();
                bufferedReader.close();
                return sb2.toString();
            }
            sb2.append(line);
        }
    }

    public final void b() {
        if (this.f46522c.isEnabled()) {
            Editable text = this.f46526g.getText();
            Editable text2 = this.f46527h.getText();
            setProgressBarIndeterminateVisibility(true);
            this.f46522c.setEnabled(false);
            if (!text.toString().endsWith("@branch.io")) {
                new d(this, this.f46528i.nextLong(), text, i.b(this), text2).execute(new Void[0]);
            } else {
                Toast.makeText(getApplicationContext(), "Goodbye", 0).show();
                finish();
            }
        }
    }

    @Override // w20.a, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(5);
        setResult(0, null);
        setContentView(2131624191);
        setProgressBarIndeterminateVisibility(false);
        View viewFindViewById = findViewById(16908290);
        final View viewFindViewById2 = findViewById(2131427749);
        final int paddingTop = viewFindViewById2.getPaddingTop();
        final int paddingBottom = viewFindViewById2.getPaddingBottom();
        final int paddingLeft = viewFindViewById2.getPaddingLeft();
        final int paddingRight = viewFindViewById2.getPaddingRight();
        a0 a0Var = new a0() { // from class: w20.a0
            @Override // a5.a0
            public final h2 u(View view, h2 h2Var) {
                Insets insetsG = h2Var.f296a.g(7);
                viewFindViewById2.setPadding(paddingLeft + insetsG.left, paddingTop + insetsG.top, paddingRight + insetsG.right, paddingBottom + insetsG.bottom);
                return h2Var;
            }
        };
        WeakHashMap weakHashMap = a1.f250a;
        s0.l(viewFindViewById, a0Var);
        q0.c(viewFindViewById);
        this.f46521b = new z6();
        this.f46525f = i.a();
        this.f46526g = (AutoCompleteTextView) findViewById(2131429109);
        EditText editText = (EditText) findViewById(2131427693);
        this.f46527h = editText;
        editText.setOnEditorActionListener(new b(this));
        new ArrayList();
        Button button = (Button) findViewById(2131428484);
        this.f46522c = button;
        button.setOnClickListener(new c(this, 0));
        SharedPreferences sharedPreferences = getSharedPreferences("com.teslacoilsw.licensing.info", 0);
        String string = sharedPreferences.getString(ActionCategory.EMAIL, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        String string2 = sharedPreferences.getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        this.f46526g.setText(string);
        this.f46527h.setText(string2);
        findViewById(2131428578).setOnClickListener(new c(this, 1));
    }

    @Override // android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
    }
}
