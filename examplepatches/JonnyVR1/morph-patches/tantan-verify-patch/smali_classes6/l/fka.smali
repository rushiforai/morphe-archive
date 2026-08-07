.class public final synthetic Ll/fka;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fka;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/fka;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/fka;->c:Z

    iput-object p4, p0, Ll/fka;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fka;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/fka;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/fka;->c:Z

    iget-object p0, p0, Ll/fka;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/jka;->i5(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
