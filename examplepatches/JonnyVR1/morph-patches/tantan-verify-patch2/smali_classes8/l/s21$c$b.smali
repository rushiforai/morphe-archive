.class public Ll/s21$c$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/s21$c;->g(Lrx/c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ll/s21$c;


# direct methods
.method public constructor <init>(Ll/s21$c;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s21$c$b;->b:Ll/s21$c;

    .line 2
    .line 3
    iput-object p2, p0, Ll/s21$c$b;->a:Ll/gcg0;

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
    iget-object v0, p0, Ll/s21$c$b;->b:Ll/s21$c;

    .line 2
    .line 3
    iget-object v0, v0, Ll/s21$c;->d:Ll/ft5;

    .line 4
    .line 5
    iget-object p0, p0, Ll/s21$c$b;->a:Ll/gcg0;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/ft5;->d(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
