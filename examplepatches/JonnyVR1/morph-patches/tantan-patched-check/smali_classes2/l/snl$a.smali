.class public Ll/snl$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/snl;->i(Ll/snl$c;Ll/vj20$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/snl$c;

.field public final synthetic b:Ll/vj20$a;

.field public final synthetic c:Ll/snl;


# direct methods
.method public constructor <init>(Ll/snl;Ll/snl$c;Ll/vj20$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/snl$a;->c:Ll/snl;

    .line 2
    .line 3
    iput-object p2, p0, Ll/snl$a;->a:Ll/snl$c;

    .line 4
    .line 5
    iput-object p3, p0, Ll/snl$a;->b:Ll/vj20$a;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/snl$a;->c:Ll/snl;

    .line 2
    .line 3
    iget-object v1, p0, Ll/snl$a;->a:Ll/snl$c;

    .line 4
    .line 5
    iget-object p0, p0, Ll/snl$a;->b:Ll/vj20$a;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/snl;->j(Ll/snl$c;Ll/vj20$a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
