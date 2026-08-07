.class public final synthetic Ll/wa60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/ab60;

.field public final synthetic b:Landroid/app/Activity;

.field public final synthetic c:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

.field public final synthetic d:Ll/ker;


# direct methods
.method public synthetic constructor <init>(Ll/ab60;Landroid/app/Activity;Lcom/clevertap/android/sdk/inapp/pipsdk/a;Ll/ker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wa60;->a:Ll/ab60;

    iput-object p2, p0, Ll/wa60;->b:Landroid/app/Activity;

    iput-object p3, p0, Ll/wa60;->c:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    iput-object p4, p0, Ll/wa60;->d:Ll/ker;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wa60;->a:Ll/ab60;

    iget-object v1, p0, Ll/wa60;->b:Landroid/app/Activity;

    iget-object v2, p0, Ll/wa60;->c:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    iget-object p0, p0, Ll/wa60;->d:Ll/ker;

    invoke-static {v0, v1, v2, p0}, Ll/ab60;->b(Ll/ab60;Landroid/app/Activity;Lcom/clevertap/android/sdk/inapp/pipsdk/a;Ll/ker;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
