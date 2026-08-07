.class public Ll/gm80$b$a;
.super Ll/er2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/gm80$b;-><init>(Ll/gm80;Ll/gm80$a;Ll/h0d0;Ll/yk90;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gm80;

.field public final synthetic b:Ll/gm80$b;


# direct methods
.method public constructor <init>(Ll/gm80$b;Ll/gm80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gm80$b$a;->b:Ll/gm80$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/gm80$b$a;->a:Ll/gm80;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/er2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gm80$b$a;->b:Ll/gm80$b;

    .line 2
    .line 3
    invoke-static {v0}, Ll/gm80$b;->p(Ll/gm80$b;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/gm80$b$a;->b:Ll/gm80$b;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/z06;->a()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
