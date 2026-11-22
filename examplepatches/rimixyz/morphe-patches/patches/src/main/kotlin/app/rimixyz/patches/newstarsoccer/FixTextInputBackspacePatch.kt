package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

/**
 * Corrige a impossibilidade de apagar caracteres ao digitar o nome em uma nova carreira.
 *
 * Causa confirmada no DEX: c_TInputBox.p_Hit/p_SetFocus chamam
 * c_TLocale.m_RequiresMyKeyboard(m_opLanguage). Esse método retorna true apenas para os idiomas
 * 10/11/12; para português retorna false e o jogo usa o EditText nativo (_autoCapitalEditText).
 * Todo o texto é enviado ao motor Monkey pelo BBAndroidGame$1.onKey, mas teclados modernos como
 * o Gboard fazem a exclusão por deleteSurroundingText e não entregam KEYCODE_DEL ao OnKeyListener.
 * Resultado: digitar funciona, apagar não.
 *
 * O jogo já tem um teclado interno (c_TScreen_Keyboard) com botão keyboard.btn_BackSpace que
 * chama m_ButtonBackSpace() e remove o último caractere de m_txt. Forçar m_RequiresMyKeyboard a
 * true faz os campos de texto usarem esse teclado, contornando o bug sem mexer no motor de texto.
 *
 * Efeito colateral: o teclado do sistema não é usado nos campos do jogo; o teclado interno
 * inclui os caracteres do idioma selecionado (c_TLocale.m_GetKeyboardChars).
 */
@Suppress("unused")
val fixTextInputBackspacePatch = patch(
    name = "Fix text input backspace",
    description = "Fixes backspace when typing names in the game by using the in-game keyboard, which has a working delete button.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        // (I)Z estático: v0/v1 livres, v2 é o parâmetro e pode ser reutilizado como retorno.
        RequiresMyKeyboardFingerprint.method.addInstructions(
            0,
            """
                const/4 v2, 0x1
                return v2
            """.trimIndent(),
        )
    }
}
