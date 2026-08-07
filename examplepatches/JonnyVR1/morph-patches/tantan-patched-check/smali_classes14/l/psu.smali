.class public final synthetic Ll/psu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/wsu;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/wsu;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/psu;->a:Ll/wsu;

    iput-object p2, p0, Ll/psu;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/psu;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/psu;->a:Ll/wsu;

    iget-object v1, p0, Ll/psu;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/psu;->c:Ll/y20;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Ll/wsu;->d(Ll/wsu;Ljava/lang/String;Ll/y20;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
