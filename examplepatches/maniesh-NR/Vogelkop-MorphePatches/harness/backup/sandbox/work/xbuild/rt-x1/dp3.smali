.class public abstract Ldp3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lesk;


# direct methods
.method public constructor <init>(Lesk;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldp3;->a:Lesk;

    return-void
.end method


# virtual methods
.method public a(Le7j;Lb7j;)Z
    .registers 5

    const/4 p0, 0x0

    sget-object v0, Le7j;->c:Le7j;

    if-eq p1, v0, :cond_a

    sget-object v1, Lb7j;->d:Lb7j;

    if-eq p2, v1, :cond_a

    return p0

    :cond_a
    if-ne p1, v0, :cond_d

    const/4 p0, 0x1

    :cond_d
    return p0
.end method

.method public abstract b()Z
.end method
