.class public Ll/f360$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f360$a;->onNext(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/f360$a;


# direct methods
.method public constructor <init>(Ll/f360$a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f360$a$a;->b:Ll/f360$a;

    .line 2
    .line 3
    iput p2, p0, Ll/f360$a$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/f360$a$a;->b:Ll/f360$a;

    .line 2
    .line 3
    iget-object v1, v0, Ll/f360$a;->e:Ll/f360$b;

    .line 4
    .line 5
    iget p0, p0, Ll/f360$a$a;->a:I

    .line 6
    .line 7
    iget-object v2, v0, Ll/f360$a;->i:Ll/are0;

    .line 8
    .line 9
    iget-object v0, v0, Ll/f360$a;->f:Ll/gcg0;

    .line 10
    .line 11
    invoke-virtual {v1, p0, v2, v0}, Ll/f360$b;->b(ILl/gcg0;Ll/gcg0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
