.class public Ll/j560$c$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/j560$c;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/j560$a;

.field public final synthetic b:Ll/j560$c;


# direct methods
.method public constructor <init>(Ll/j560$c;Ll/j560$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j560$c$b;->b:Ll/j560$c;

    .line 2
    .line 3
    iput-object p2, p0, Ll/j560$c$b;->a:Ll/j560$a;

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
    iget-object v0, p0, Ll/j560$c$b;->b:Ll/j560$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/j560$c$b;->a:Ll/j560$a;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/j560$c;->j(Ll/j560$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
