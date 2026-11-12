.class public final Lv10;
.super Lxz;
.source "SourceFile"


# instance fields
.field public final b:I

.field public final c:Lcie;


# direct methods
.method public constructor <init>(Lwz;ILcie;)V
    .registers 4

    invoke-direct {p0, p1}, Lxz;-><init>(Lwz;)V

    iput p2, p0, Lv10;->b:I

    iput-object p3, p0, Lv10;->c:Lcie;

    return-void
.end method


# virtual methods
.method public final c()V
    .registers 2

    iget-object v0, p0, Lv10;->c:Lcie;

    iget p0, p0, Lv10;->b:I

    invoke-virtual {v0, p0}, Lcie;->g(I)V

    return-void
.end method
