.class public final synthetic Ll/e95;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/n1c;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ll/n1c;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e95;->a:Ll/n1c;

    iput-object p2, p0, Ll/e95;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e95;->a:Ll/n1c;

    iget-object p0, p0, Ll/e95;->b:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/CleverTapFactory;->d(Ll/n1c;Landroid/content/Context;)Ll/h1c;

    move-result-object p0

    return-object p0
.end method
