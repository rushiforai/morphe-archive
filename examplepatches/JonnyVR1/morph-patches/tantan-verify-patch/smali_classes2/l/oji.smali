.class public final synthetic Ll/oji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Lcom/clevertap/android/sdk/Logger;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/Logger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oji;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/oji;->b:Lcom/clevertap/android/sdk/Logger;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oji;->a:Landroid/content/Context;

    iget-object p0, p0, Ll/oji;->b:Lcom/clevertap/android/sdk/Logger;

    invoke-static {v0, p0}, Ll/pji$a;->a(Landroid/content/Context;Lcom/clevertap/android/sdk/Logger;)Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    move-result-object p0

    return-object p0
.end method
