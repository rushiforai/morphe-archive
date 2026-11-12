.class public final Ldnh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lfnh;


# direct methods
.method public constructor <init>(Lfnh;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldnh;->a:Lfnh;

    return-void
.end method


# virtual methods
.method public final onDestroy()V
    .registers 2

    iget-object p0, p0, Ldnh;->a:Lfnh;

    const/4 v0, 0x0

    iput-object v0, p0, Lfnh;->c:Lk6l;

    return-void
.end method
