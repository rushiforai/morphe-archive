.class public final synthetic Le/e/a/PlaylistTransfer100$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/ExpandableListView$OnChildClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaylistTransfer100;"
    method = "lambda$pickPlaylist$2"
    proto = "([Ljava/lang/String;Ljava/util/ArrayList;Landroid/app/AlertDialog;Ljava/util/ArrayList;Landroid/widget/ExpandableListView;Landroid/widget/Button;Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z"
.end annotation


# instance fields
.field public final synthetic f$0:[Ljava/lang/String;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Landroid/app/AlertDialog;

.field public final synthetic f$3:Ljava/util/ArrayList;

.field public final synthetic f$4:Landroid/widget/ExpandableListView;

.field public final synthetic f$5:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/String;Ljava/util/ArrayList;Landroid/app/AlertDialog;Ljava/util/ArrayList;Landroid/widget/ExpandableListView;Landroid/widget/Button;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaylistTransfer100$2;->f$0:[Ljava/lang/String;

    iput-object p2, p0, Le/e/a/PlaylistTransfer100$2;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Le/e/a/PlaylistTransfer100$2;->f$2:Landroid/app/AlertDialog;

    iput-object p4, p0, Le/e/a/PlaylistTransfer100$2;->f$3:Ljava/util/ArrayList;

    iput-object p5, p0, Le/e/a/PlaylistTransfer100$2;->f$4:Landroid/widget/ExpandableListView;

    iput-object p6, p0, Le/e/a/PlaylistTransfer100$2;->f$5:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final onChildClick(Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z
    .registers 19

    .line 0
    iget-object v0, p0, Le/e/a/PlaylistTransfer100$2;->f$0:[Ljava/lang/String;

    iget-object v1, p0, Le/e/a/PlaylistTransfer100$2;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/PlaylistTransfer100$2;->f$2:Landroid/app/AlertDialog;

    iget-object v3, p0, Le/e/a/PlaylistTransfer100$2;->f$3:Ljava/util/ArrayList;

    iget-object v4, p0, Le/e/a/PlaylistTransfer100$2;->f$4:Landroid/widget/ExpandableListView;

    iget-object v5, p0, Le/e/a/PlaylistTransfer100$2;->f$5:Landroid/widget/Button;

    move-object v6, p1

    move-object v7, p2

    move v8, p3

    move/from16 v9, p4

    move-wide/from16 v10, p5

    invoke-static/range {v0 .. v11}, Le/e/a/PlaylistTransfer100;->lambda$pickPlaylist$2([Ljava/lang/String;Ljava/util/ArrayList;Landroid/app/AlertDialog;Ljava/util/ArrayList;Landroid/widget/ExpandableListView;Landroid/widget/Button;Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z

    move-result p1

    return p1
.end method
