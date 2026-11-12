.class public final synthetic Lid5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lee5;
.implements Lfjc;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ld11;Ljava/lang/Object;J)V
    .registers 5

    const/4 p1, 0x2

    iput-byte p1, p0, Lid5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lid5;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lid5;->a:B

    iput-object p1, p0, Lid5;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Le11;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final r(Lx79;)Ljava/lang/Object;
    .registers 2

    iget-byte p1, p0, Lid5;->a:B

    iget-object p0, p0, Lid5;->b:Ljava/lang/Object;

    return-object p0
.end method
