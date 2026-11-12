.class public final Lcom/opera/android/translate_web_pages/TranslationData;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lcom/opera/android/translate_web_pages/TranslationData;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lcom/opera/android/translate_web_pages/TranslationData;

    const/4 v1, 0x0

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lcom/opera/android/translate_web_pages/TranslationData;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/opera/android/translate_web_pages/TranslationData;->c:Lcom/opera/android/translate_web_pages/TranslationData;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/opera/android/translate_web_pages/TranslationData;->a:I

    iput-object p2, p0, Lcom/opera/android/translate_web_pages/TranslationData;->b:Ljava/lang/String;

    return-void
.end method
