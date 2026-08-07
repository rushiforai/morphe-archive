.class public final synthetic Ll/mue0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/pue0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/pue0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mue0;->a:Ll/pue0;

    iput-object p2, p0, Ll/mue0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/mue0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mue0;->a:Ll/pue0;

    iget-object v1, p0, Ll/mue0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/mue0;->c:Ljava/lang/String;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Ll/pue0;->k0(Ll/pue0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
