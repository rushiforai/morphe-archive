.class public final synthetic Ll/hdg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/idg;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/idg;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hdg;->a:Ll/idg;

    iput-boolean p2, p0, Ll/hdg;->b:Z

    iput-boolean p3, p0, Ll/hdg;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hdg;->a:Ll/idg;

    iget-boolean v1, p0, Ll/hdg;->b:Z

    iget-boolean p0, p0, Ll/hdg;->c:Z

    check-cast p1, Ll/aeg;

    invoke-static {v0, v1, p0, p1}, Ll/idg;->i4(Ll/idg;ZZLl/aeg;)V

    return-void
.end method
