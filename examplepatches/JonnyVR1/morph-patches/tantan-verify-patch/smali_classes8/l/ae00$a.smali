.class public Ll/ae00$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lpw;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ae00;->z(Ll/hn50;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/hn50;

.field public final synthetic b:Ll/ae00;


# direct methods
.method public constructor <init>(Ll/ae00;Ll/hn50;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ae00$a;->b:Ll/ae00;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ae00$a;->a:Ll/hn50;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00$a;->a:Ll/hn50;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/hn50;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00$a;->a:Ll/hn50;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/hn50;->b(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ae00$a;->a:Ll/hn50;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ae00$a;->b:Ll/ae00;

    .line 4
    .line 5
    invoke-static {p0}, Ll/ae00;->l(Ll/ae00;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ll/hn50;->c(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
