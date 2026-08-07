.class public final synthetic Ll/pw2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uw2;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:F


# direct methods
.method public synthetic constructor <init>(Ll/uw2;Ljava/lang/String;Ljava/lang/String;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pw2;->a:Ll/uw2;

    iput-object p2, p0, Ll/pw2;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/pw2;->c:Ljava/lang/String;

    iput p4, p0, Ll/pw2;->d:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pw2;->a:Ll/uw2;

    iget-object v1, p0, Ll/pw2;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/pw2;->c:Ljava/lang/String;

    iget p0, p0, Ll/pw2;->d:F

    invoke-static {v0, v1, v2, p0}, Ll/uw2;->F(Ll/uw2;Ljava/lang/String;Ljava/lang/String;F)V

    return-void
.end method
