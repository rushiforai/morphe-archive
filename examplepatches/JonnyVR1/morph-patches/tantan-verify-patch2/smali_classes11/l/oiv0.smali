.class public final synthetic Ll/oiv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/piv0;

.field public final synthetic b:Ll/b7w0;

.field public final synthetic c:Ll/q6w0;

.field public final synthetic d:Ll/scv0;


# direct methods
.method public synthetic constructor <init>(Ll/piv0;Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oiv0;->a:Ll/piv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/oiv0;->b:Ll/b7w0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/oiv0;->c:Ll/q6w0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/oiv0;->d:Ll/scv0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oiv0;->a:Ll/piv0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/piv0;->d:Ll/riv0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/oiv0;->b:Ll/b7w0;

    .line 6
    .line 7
    iget-object v2, p0, Ll/oiv0;->c:Ll/q6w0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/oiv0;->d:Ll/scv0;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0}, Ll/riv0;->d(Ll/riv0;Ll/b7w0;Ll/q6w0;Ll/scv0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
