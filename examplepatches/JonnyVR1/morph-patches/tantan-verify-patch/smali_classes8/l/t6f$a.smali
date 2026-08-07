.class public Ll/t6f$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/t6f;->E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/t6f;


# direct methods
.method public constructor <init>(Ll/t6f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t6f$a;->a:Ll/t6f;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/t6f$a;->a:Ll/t6f;

    .line 2
    .line 3
    invoke-static {p0}, Ll/t6f;->z(Ll/t6f;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p0, p1}, Ll/t6f;->A(Ll/t6f;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(I)V
    .locals 0

    .line 1
    return-void
.end method
