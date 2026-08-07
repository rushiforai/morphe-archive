.class public final synthetic Ll/ba60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/ca60;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;


# direct methods
.method public synthetic constructor <init>(Ll/ca60;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ba60;->a:Ll/ca60;

    iput-object p2, p0, Ll/ba60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ba60;->a:Ll/ca60;

    iget-object p0, p0, Ll/ba60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    invoke-static {v0, p0}, Ll/ca60;->a(Ll/ca60;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
