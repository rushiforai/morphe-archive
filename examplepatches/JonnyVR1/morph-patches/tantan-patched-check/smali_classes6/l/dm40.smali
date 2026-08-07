.class public final synthetic Ll/dm40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:I

.field public final synthetic c:Z

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;IZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dm40;->a:Lcom/p1/mobile/android/app/Act;

    iput p2, p0, Ll/dm40;->b:I

    iput-boolean p3, p0, Ll/dm40;->c:Z

    iput-object p4, p0, Ll/dm40;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dm40;->a:Lcom/p1/mobile/android/app/Act;

    iget v1, p0, Ll/dm40;->b:I

    iget-boolean v2, p0, Ll/dm40;->c:Z

    iget-object p0, p0, Ll/dm40;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0}, Ll/cn40;->C(Lcom/p1/mobile/android/app/Act;IZLl/y20;)V

    return-void
.end method
