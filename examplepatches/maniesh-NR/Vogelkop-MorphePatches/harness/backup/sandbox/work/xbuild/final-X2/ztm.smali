.class public final Lztm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldue;


# instance fields
.field public final synthetic a:Lfue;

.field public final synthetic b:Laum;


# direct methods
.method public constructor <init>(Laum;Lfue;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lztm;->a:Lfue;

    iput-object p1, p0, Lztm;->b:Laum;

    return-void
.end method


# virtual methods
.method public final b(Lcue;)V
    .registers 3

    sget-object v0, Lcue;->c:Lcue;

    if-ne p1, v0, :cond_e

    iget-object p1, p0, Lztm;->a:Lfue;

    invoke-virtual {p1, p0}, Lfue;->e(Ldue;)V

    iget-object p0, p0, Lztm;->b:Laum;

    invoke-virtual {p0}, Laum;->a()V

    :cond_e
    return-void
.end method
