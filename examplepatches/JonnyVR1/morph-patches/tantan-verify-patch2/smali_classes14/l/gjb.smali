.class public final synthetic Ll/gjb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dkb;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/dkb;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gjb;->a:Ll/dkb;

    iput-object p2, p0, Ll/gjb;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/gjb;->c:Z

    iput-boolean p4, p0, Ll/gjb;->d:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gjb;->a:Ll/dkb;

    iget-object v1, p0, Ll/gjb;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/gjb;->c:Z

    iget-boolean p0, p0, Ll/gjb;->d:Z

    invoke-static {v0, v1, v2, p0}, Ll/dkb;->z3(Ll/dkb;Ljava/lang/String;ZZ)Lrx/c;

    move-result-object p0

    return-object p0
.end method
