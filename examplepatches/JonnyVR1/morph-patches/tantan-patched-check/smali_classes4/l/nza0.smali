.class public final synthetic Ll/nza0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/HashSet;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nza0;->a:Ljava/util/HashSet;

    iput p2, p0, Ll/nza0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nza0;->a:Ljava/util/HashSet;

    iget p0, p0, Ll/nza0;->b:I

    invoke-static {v0, p0}, Ll/pza0;->b(Ljava/util/HashSet;I)V

    return-void
.end method
