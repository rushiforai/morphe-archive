.class public final Lu9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw7l;


# instance fields
.field public final synthetic a:Lkm5;

.field public final synthetic b:Lv9l;

.field public final synthetic c:Lp6l;


# direct methods
.method public constructor <init>(Lkm5;Lv9l;Lp6l;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu9l;->a:Lkm5;

    iput-object p2, p0, Lu9l;->b:Lv9l;

    iput-object p3, p0, Lu9l;->c:Lp6l;

    return-void
.end method


# virtual methods
.method public final a(ILdyg;)V
    .registers 3

    iget-object p1, p0, Lu9l;->a:Lkm5;

    iget-boolean p2, p1, Lkm5;->a:Z

    if-nez p2, :cond_11

    iget-boolean p1, p1, Lkm5;->b:Z

    if-nez p1, :cond_11

    iget-object p1, p0, Lu9l;->b:Lv9l;

    iget-object p0, p0, Lu9l;->c:Lp6l;

    invoke-virtual {p1, p0}, Lv9l;->a(Lp6l;)V

    :cond_11
    return-void
.end method

.method public final b(ILb8l;)V
    .registers 3

    return-void
.end method
