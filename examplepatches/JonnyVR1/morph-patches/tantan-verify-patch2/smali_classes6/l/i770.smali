.class public final synthetic Ll/i770;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/w770;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/w770;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i770;->a:Ll/w770;

    iput-object p2, p0, Ll/i770;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/i770;->c:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i770;->a:Ll/w770;

    iget-object v1, p0, Ll/i770;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/i770;->c:Z

    invoke-static {v0, v1, p0}, Ll/w770;->t0(Ll/w770;Ljava/lang/String;Z)V

    return-void
.end method
