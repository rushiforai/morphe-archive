.class public final synthetic Ll/qia;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qia;->a:Ll/jka;

    iput-object p2, p0, Ll/qia;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/qia;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qia;->a:Ll/jka;

    iget-object v1, p0, Ll/qia;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/qia;->c:Ljava/util/List;

    invoke-static {v0, v1, p0}, Ll/jka;->j6(Ll/jka;Ljava/lang/String;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
