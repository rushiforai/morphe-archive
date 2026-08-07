.class public final synthetic Ll/xgp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/ygp;


# direct methods
.method public synthetic constructor <init>(Ll/ygp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xgp;->a:Ll/ygp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xgp;->a:Ll/ygp;

    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Ljava/lang/Boolean;

    invoke-static {p0, p1, p2}, Ll/ygp;->a(Ll/ygp;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    return-void
.end method
