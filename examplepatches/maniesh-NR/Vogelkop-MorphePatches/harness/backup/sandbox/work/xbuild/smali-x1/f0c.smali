.class public final synthetic Lf0c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls3m;


# instance fields
.field public final synthetic a:Lv3m;


# direct methods
.method public synthetic constructor <init>(Lv3m;)V
    .registers 2

    iput-object p1, p0, Lf0c;->a:Lv3m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lszb;)V
    .registers 5

    iget-object p0, p0, Lf0c;->a:Lv3m;

    iget-object v0, p0, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "translate_web_pages_to_language"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lv3m;->i(Lszb;)V

    return-void
.end method
