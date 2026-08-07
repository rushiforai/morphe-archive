.class public final synthetic Ll/dcl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ecl0;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ecl0;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dcl0;->a:Ll/ecl0;

    iput-boolean p2, p0, Ll/dcl0;->b:Z

    iput-object p3, p0, Ll/dcl0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/dcl0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/dcl0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/dcl0;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dcl0;->a:Ll/ecl0;

    iget-boolean v1, p0, Ll/dcl0;->b:Z

    iget-object v2, p0, Ll/dcl0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/dcl0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/dcl0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/dcl0;->f:Ljava/lang/String;

    move-object v6, p1

    check-cast v6, Landroid/net/NetworkInfo;

    invoke-static/range {v0 .. v6}, Ll/ecl0;->e(Ll/ecl0;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/NetworkInfo;)V

    return-void
.end method
