.class public Ll/oij0$a;
.super Lokio/AsyncTimeout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/oij0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/oij0;


# direct methods
.method public constructor <init>(Ll/oij0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oij0$a;->a:Ll/oij0;

    .line 2
    .line 3
    invoke-direct {p0}, Lokio/AsyncTimeout;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public timedOut()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oij0$a;->a:Ll/oij0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/oij0;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
