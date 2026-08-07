.class public Ll/n360$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n360;->a(Ll/gcg0;)Ll/gcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/n360$b;

.field public final synthetic b:Ll/n360;


# direct methods
.method public constructor <init>(Ll/n360;Ll/n360$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n360$a;->b:Ll/n360;

    .line 2
    .line 3
    iput-object p2, p0, Ll/n360$a;->a:Ll/n360$b;

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
    iget-object v0, p0, Ll/n360$a;->b:Ll/n360;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n360;->a:Ll/y20;

    .line 4
    .line 5
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/n360$a;->a:Ll/n360$b;

    .line 13
    .line 14
    invoke-static {p0, p1, p2}, Ll/n360$b;->g(Ll/n360$b;J)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
