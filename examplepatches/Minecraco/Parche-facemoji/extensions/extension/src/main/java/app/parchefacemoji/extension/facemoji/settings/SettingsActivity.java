package app.parchefacemoji.extension.facemoji.settings;

import android.app.Activity;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/**
 * Pantalla de ajustes del parche ("Ajustes de Minecraco").
 *
 * Se construye en codigo a proposito: asi no depende de ningun recurso ni layout de la app,
 * que cambia entre versiones. Cada interruptor se guarda al momento y los hooks del parche
 * lo leen de {@link PatchPreferences}.
 */
public class SettingsActivity extends Activity {

    @Override
    protected void onCreate(Bundle estadoGuardado) {
        super.onCreate(estadoGuardado);

        PatchPreferences.iniciar(this);

        ScrollView desplazamiento = new ScrollView(this);
        LinearLayout raiz = new LinearLayout(this);
        raiz.setOrientation(LinearLayout.VERTICAL);
        int margen = dp(24);
        raiz.setPadding(margen, margen, margen, margen);
        desplazamiento.addView(raiz);

        TextView titulo = new TextView(this);
        titulo.setText("Ajustes Minecraco");
        titulo.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24);
        titulo.setGravity(Gravity.START);
        titulo.setPadding(0, 0, 0, dp(4));
        raiz.addView(titulo);

        raiz.addView(texto(
                "Estos interruptores se aplican al instante: no hace falta volver a parchear "
                        + "ni reiniciar la app.",
                dp(6)
        ));

        raiz.addView(interruptor(
                "Bloquear anuncios",
                "Apaga las sugerencias patrocinadas que Facemoji inserta en la barra de "
                        + "sugerencias del teclado.",
                PatchPreferences.CLAVE_ANUNCIOS,
                PatchPreferences.anuncios()
        ));

        raiz.addView(interruptor(
                "Desbloquear VIP",
                "Trata como gratuitas las fuentes de color, las series de stickers, los "
                        + "TextBomb y las frases del teclado Rizz.",
                PatchPreferences.CLAVE_VIP,
                PatchPreferences.vip()
        ));

        raiz.addView(interruptor(
                "Desactivar rastreo",
                "Deja de enviar eventos a Firebase Analytics, Crashlytics y AppsFlyer.",
                PatchPreferences.CLAVE_RASTREO,
                PatchPreferences.rastreo()
        ));

        raiz.addView(texto(
                "El permiso de ID de publicidad se quita al parchear la app, asi que no se "
                        + "puede cambiar desde aqui.",
                dp(24)
        ));

        TextView pie = texto(
                "Parche Facemoji · github.com/Minecraco/Parche-facemoji\n"
                        + "Los cambios se guardan solo en este dispositivo.",
                0
        );
        pie.setPadding(0, dp(16), 0, 0);
        raiz.addView(pie);

        setContentView(desplazamiento);
    }

    private LinearLayout interruptor(
            String titulo,
            String descripcion,
            final String clave,
            boolean activo
    ) {
        LinearLayout caja = new LinearLayout(this);
        caja.setOrientation(LinearLayout.VERTICAL);
        caja.setPadding(0, dp(20), 0, 0);

        Switch boton = new Switch(this);
        boton.setText(titulo);
        boton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        boton.setChecked(activo);
        boton.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton vista, boolean marcado) {
                PatchPreferences.guardar(clave, marcado);
            }
        });

        caja.addView(boton);
        caja.addView(texto(descripcion, dp(2)));
        return caja;
    }

    private TextView texto(String contenido, int margenSuperior) {
        TextView vista = new TextView(this);
        vista.setText(contenido);
        vista.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        vista.setPadding(0, margenSuperior, 0, 0);
        return vista;
    }

    private int dp(int valor) {
        return (int) (valor * getResources().getDisplayMetrics().density);
    }
}
