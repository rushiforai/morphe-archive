.class public final synthetic Ll/j95;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/uzd;

.field public final synthetic b:Ll/w36;

.field public final synthetic c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field public final synthetic d:Landroid/content/Context;

.field public final synthetic e:Ll/h6g0;

.field public final synthetic f:Ll/wpm;

.field public final synthetic g:Ll/su3;


# direct methods
.method public synthetic constructor <init>(Ll/uzd;Ll/w36;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Landroid/content/Context;Ll/h6g0;Ll/wpm;Ll/su3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j95;->a:Ll/uzd;

    iput-object p2, p0, Ll/j95;->b:Ll/w36;

    iput-object p3, p0, Ll/j95;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iput-object p4, p0, Ll/j95;->d:Landroid/content/Context;

    iput-object p5, p0, Ll/j95;->e:Ll/h6g0;

    iput-object p6, p0, Ll/j95;->f:Ll/wpm;

    iput-object p7, p0, Ll/j95;->g:Ll/su3;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/j95;->a:Ll/uzd;

    iget-object v1, p0, Ll/j95;->b:Ll/w36;

    iget-object v2, p0, Ll/j95;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iget-object v3, p0, Ll/j95;->d:Landroid/content/Context;

    iget-object v4, p0, Ll/j95;->e:Ll/h6g0;

    iget-object v5, p0, Ll/j95;->f:Ll/wpm;

    iget-object v6, p0, Ll/j95;->g:Ll/su3;

    invoke-static/range {v0 .. v6}, Lcom/clevertap/android/sdk/CleverTapFactory;->a(Ll/uzd;Ll/w36;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Landroid/content/Context;Ll/h6g0;Ll/wpm;Ll/su3;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
