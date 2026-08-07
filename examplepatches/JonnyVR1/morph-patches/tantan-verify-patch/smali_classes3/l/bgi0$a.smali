.class public Ll/bgi0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bgi0;->m0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/bgi0;


# direct methods
.method public constructor <init>(Ll/bgi0;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bgi0$a;->d:Ll/bgi0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bgi0$a;->a:Ll/xc00;

    .line 4
    .line 5
    iput-object p3, p0, Ll/bgi0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/bgi0$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ll/bgi0$a;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/bgi0$a;->b(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bgi0$a;->d:Ll/bgi0;

    .line 2
    .line 3
    invoke-static {p0, p1, p3, p2}, Ll/bgi0;->h0(Ll/bgi0;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public call()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/bgi0$a;->d:Ll/bgi0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bgi0$a;->a:Ll/xc00;

    .line 4
    .line 5
    iget-object v2, p0, Ll/bgi0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Ll/bgi0$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v4, Ll/agi0;

    .line 10
    .line 11
    invoke-direct {v4, p0, v1, v3}, Ll/agi0;-><init>(Ll/bgi0$a;Ll/xc00;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1, v2, v4}, Ll/bgi0;->e0(Ll/bgi0;Ll/bqq;Ljava/lang/String;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
