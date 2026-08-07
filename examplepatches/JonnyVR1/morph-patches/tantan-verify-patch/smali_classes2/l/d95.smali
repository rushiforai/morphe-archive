.class public final synthetic Ll/d95;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ll/w36;

.field public final synthetic c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field public final synthetic d:Ll/uzd;

.field public final synthetic e:Ll/ch2;

.field public final synthetic f:Ll/sk0;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ll/w36;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/uzd;Ll/ch2;Ll/sk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d95;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/d95;->b:Ll/w36;

    iput-object p3, p0, Ll/d95;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iput-object p4, p0, Ll/d95;->d:Ll/uzd;

    iput-object p5, p0, Ll/d95;->e:Ll/ch2;

    iput-object p6, p0, Ll/d95;->f:Ll/sk0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/d95;->a:Landroid/content/Context;

    iget-object v1, p0, Ll/d95;->b:Ll/w36;

    iget-object v2, p0, Ll/d95;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iget-object v3, p0, Ll/d95;->d:Ll/uzd;

    iget-object v4, p0, Ll/d95;->e:Ll/ch2;

    iget-object v5, p0, Ll/d95;->f:Ll/sk0;

    invoke-static/range {v0 .. v5}, Lcom/clevertap/android/sdk/CleverTapFactory;->g(Landroid/content/Context;Ll/w36;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/uzd;Ll/ch2;Ll/sk0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
