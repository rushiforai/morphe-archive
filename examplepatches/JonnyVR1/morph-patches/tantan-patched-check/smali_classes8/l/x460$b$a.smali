.class public Ll/x460$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/x460$b;->a(Ll/y460$c;Ljava/lang/Long;Ljava/lang/Object;Ll/f2e0$a;)Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y460$c;

.field public final synthetic b:Ljava/lang/Long;

.field public final synthetic c:Ll/x460$b;


# direct methods
.method public constructor <init>(Ll/x460$b;Ll/y460$c;Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x460$b$a;->c:Ll/x460$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/x460$b$a;->a:Ll/y460$c;

    .line 4
    .line 5
    iput-object p3, p0, Ll/x460$b$a;->b:Ljava/lang/Long;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/x460$b$a;->a:Ll/y460$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/x460$b$a;->b:Ljava/lang/Long;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ll/y460$c;->g(J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
