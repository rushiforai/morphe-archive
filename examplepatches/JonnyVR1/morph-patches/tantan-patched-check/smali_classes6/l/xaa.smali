.class public final synthetic Ll/xaa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ll/pcj;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ll/pcj;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xaa;->a:Ll/jka;

    iput-object p2, p0, Ll/xaa;->b:Ll/pcj;

    iput-object p3, p0, Ll/xaa;->c:Ljava/lang/String;

    iput p4, p0, Ll/xaa;->d:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xaa;->a:Ll/jka;

    iget-object v1, p0, Ll/xaa;->b:Ll/pcj;

    iget-object v2, p0, Ll/xaa;->c:Ljava/lang/String;

    iget p0, p0, Ll/xaa;->d:I

    invoke-static {v0, v1, v2, p0}, Ll/jka;->A1(Ll/jka;Ll/pcj;Ljava/lang/String;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method
