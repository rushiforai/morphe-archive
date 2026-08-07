.class public Ll/z4f$a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z4f$a;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/z4f$a;


# direct methods
.method public constructor <init>(Ll/z4f$a;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z4f$a$b;->b:Ll/z4f$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/z4f$a$b;->a:Ll/x20;

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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z4f$a$b;->b:Ll/z4f$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/z4f$a;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/z4f$a$b;->a:Ll/x20;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
