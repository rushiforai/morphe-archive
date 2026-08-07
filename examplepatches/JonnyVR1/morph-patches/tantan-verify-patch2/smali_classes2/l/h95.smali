.class public final synthetic Ll/h95;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/uzd;


# direct methods
.method public synthetic constructor <init>(Ll/uzd;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h95;->a:Ll/uzd;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h95;->a:Ll/uzd;

    invoke-static {p0}, Lcom/clevertap/android/sdk/CleverTapFactory;->f(Ll/uzd;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
