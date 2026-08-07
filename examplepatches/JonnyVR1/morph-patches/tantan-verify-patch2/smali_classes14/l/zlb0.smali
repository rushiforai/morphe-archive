.class public final synthetic Ll/zlb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cmb0;

.field public final synthetic b:Ll/cmb0$g;


# direct methods
.method public synthetic constructor <init>(Ll/cmb0;Ll/cmb0$g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zlb0;->a:Ll/cmb0;

    iput-object p2, p0, Ll/zlb0;->b:Ll/cmb0$g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zlb0;->a:Ll/cmb0;

    iget-object p0, p0, Ll/zlb0;->b:Ll/cmb0$g;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/cmb0;->h(Ll/cmb0;Ll/cmb0$g;Ljava/lang/String;)V

    return-void
.end method
