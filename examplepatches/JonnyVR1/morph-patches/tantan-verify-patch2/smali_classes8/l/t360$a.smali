.class public Ll/t360$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/t360;->a(Ll/gcg0;)Ll/gcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/t360$c;

.field public final synthetic b:Ll/t360;


# direct methods
.method public constructor <init>(Ll/t360;Ll/t360$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t360$a;->b:Ll/t360;

    .line 2
    .line 3
    iput-object p2, p0, Ll/t360$a;->a:Ll/t360$c;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/t360$a;->a:Ll/t360$c;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/t360$c;->i(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
