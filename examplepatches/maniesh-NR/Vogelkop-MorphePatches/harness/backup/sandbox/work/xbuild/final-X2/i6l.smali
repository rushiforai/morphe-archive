.class public final Li6l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lk6l;


# direct methods
.method public constructor <init>(Lk6l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li6l;->a:Lk6l;

    return-void
.end method


# virtual methods
.method public a(Lq5j;)V
    .registers 3
    .annotation runtime Lvkk;
    .end annotation

    iget-object p1, p1, Lq5j;->b:Ljava/lang/String;

    const-string v0, "user_agent"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_f

    iget-object p0, p0, Li6l;->a:Lk6l;

    invoke-virtual {p0}, Lk6l;->z()V

    :cond_f
    return-void
.end method
