.class public final synthetic Ll/wgp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/ygp;


# direct methods
.method public synthetic constructor <init>(Ll/ygp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wgp;->a:Ll/ygp;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wgp;->a:Ll/ygp;

    invoke-static {p0}, Ll/ygp;->b(Ll/ygp;)Ll/ygp$a;

    move-result-object p0

    return-object p0
.end method
